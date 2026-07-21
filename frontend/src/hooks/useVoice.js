import { useState, useRef, useCallback } from "preact/hooks";

/**
 * useVoice — Web Speech API wrapper
 * Core to Kamaii's voice-first UX.
 *
 * @param {object} options
 * @param {string} options.lang      — BCP-47 language tag (e.g. "hi-IN")
 * @param {function} options.onResult — called with final transcript string
 * @param {function} options.onError  — called with error
 *
 * @returns { listening, start, stop, supported, transcript }
 */
export function useVoice({ lang = "hi-IN", onResult, onError } = {}) {
  const [listening,   setListening]   = useState(false);
  const [transcript,  setTranscript]  = useState("");
  const recognizerRef = useRef(null);

  const supported = typeof window !== "undefined" &&
    ("SpeechRecognition" in window || "webkitSpeechRecognition" in window);

  const start = useCallback(() => {
    if (!supported || listening) return;

    const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
    const recognizer = new SpeechRecognition();

    recognizer.lang            = lang;
    recognizer.interimResults  = false;
    recognizer.maxAlternatives = 1;
    recognizer.continuous      = false;

    recognizer.onstart = () => setListening(true);
    recognizer.onend   = () => setListening(false);

    recognizer.onresult = (e) => {
      const result = e.results[e.results.length - 1][0].transcript.trim();
      setTranscript(result);
      onResult?.(result);
    };

    recognizer.onerror = (e) => {
      setListening(false);
      onError?.(e.error);
    };

    recognizerRef.current = recognizer;
    recognizer.start();
  }, [supported, listening, lang, onResult, onError]);

  const stop = useCallback(() => {
    recognizerRef.current?.stop();
    setListening(false);
  }, []);

  return { listening, start, stop, supported, transcript };
}
