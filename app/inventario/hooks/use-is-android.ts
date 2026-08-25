"use client";

import { useSyncExternalStore } from "react";

const emptySnapshot = false;

function getAndroidSnapshot() {
  const ua = navigator.userAgent || "";
  return /android/i.test(ua);
}

function getServerSnapshot() {
  return emptySnapshot;
}

export function useIsAndroid() {
  return useSyncExternalStore(
    () => () => {},
    getAndroidSnapshot,
    getServerSnapshot,
  );
}
