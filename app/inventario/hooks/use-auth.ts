import { useState, useEffect, useCallback } from "react";
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

  const logout = useCallback(() => {
    if (typeof window !== "undefined") {
      localStorage.removeItem("mro_auth");
      window.location.replace("/auth/login");
    }
  }, []);

  useEffect(() => {
    const auth = readAuthFromStorage();
    const isPublic = window.location.pathname.startsWith('/auth');

    if (!auth.user || !auth.token) {
      if (!isPublic) {
        logout();
      } else {
        setIsLoading(false);
      }
      return;
    }

    // Set initial memory state to prevent layout flash
    setUser(auth.user);
    setToken(auth.token);

    // Verify token validity with server
    fetch('/api/auth/me', {
      headers: { Authorization: `Bearer ${auth.token}` },
      cache: 'no-store',
    })
      .then((res) => {
        if (!res.ok) {
          // Token expired, revoked or user inactive
          logout();
          return null;
        }
        return res.json();
      })
      .then((data) => {
        if (data?.user) {
          setUser(data.user);
          // Sync fresh user data to localStorage
          localStorage.setItem('mro_auth', JSON.stringify({ user: data.user, token: auth.token }));

          if (isPublic) {
            window.location.replace("/inventario");
          }
        }
      })
      .catch(() => {
        // Network issue, retain cached user but don't block
      })
      .finally(() => {
        setIsLoading(false);
      });
  }, [logout]);

  return { user, setUser, token, setToken, isLoading, logout };
}
