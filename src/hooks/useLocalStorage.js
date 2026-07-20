import { useState } from "preact/hooks";

/**
 * useLocalStorage — synced state backed by localStorage
 *
 * @param {string} key
 * @param {*} defaultValue
 * @returns [value, setValue, removeValue]
 */
export function useLocalStorage(key, defaultValue) {
  const [storedValue, setStoredValue] = useState(() => {
    try {
      const item = window.localStorage.getItem(key);
      return item !== null ? JSON.parse(item) : defaultValue;
    } catch {
      return defaultValue;
    }
  });

  function setValue(value) {
    try {
      const valueToStore = value instanceof Function ? value(storedValue) : value;
      setStoredValue(valueToStore);
      window.localStorage.setItem(key, JSON.stringify(valueToStore));
    } catch (err) {
      console.warn(`useLocalStorage: could not write key "${key}"`, err);
    }
  }

  function removeValue() {
    try {
      window.localStorage.removeItem(key);
      setStoredValue(defaultValue);
    } catch (err) {
      console.warn(`useLocalStorage: could not remove key "${key}"`, err);
    }
  }

  return [storedValue, setValue, removeValue];
}
