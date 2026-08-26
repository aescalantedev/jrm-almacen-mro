import { useState, useEffect } from "react";
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
  const [user, setUser] = useState<User | null>(null);
  const [token, setToken] = useState("");
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    const auth = readAuthFromStorage();
    if (!auth.user || !auth.token) {
      const isPublic = window.location.pathname.startsWith('/auth');
      if (!isPublic) {
        window.location.href = "/auth/login";
      } else {
        setIsLoading(false);
      }
    } else {
      setUser(auth.user);
      setToken(auth.token);
      setIsLoading(false);
    }
  }, []);
  const logout = () => {
    localStorage.removeItem("mro_auth");
    window.location.href = "/auth/login";
  };

  return { user, setUser, token, setToken, isLoading, logout };
}
