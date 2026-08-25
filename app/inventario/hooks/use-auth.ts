import { useState } from "react";
import type { User } from "../types";

function readAuthFromStorage(): { user: User | null; token: string } {
  if (typeof window === "undefined") return { user: null, token: "" };
  try {
    const raw = localStorage.getItem("mro_auth");
    if (raw) {
      const d = JSON.parse(raw);
      return { user: d.user, token: d.token };
    }
  } catch {
    // invalid data
  }
  return { user: null, token: "" };
}

export function useAuth() {
  const [user, setUser] = useState<User | null>(() => {
    const auth = readAuthFromStorage();
    if (!auth.user || !auth.token) {
      if (typeof window !== "undefined") window.location.href = "/auth/login";
    }
    return auth.user;
  });

  const [token, setToken] = useState(() => readAuthFromStorage().token);

  return { user, setUser, token, setToken };
}
