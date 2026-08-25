import { CheckCircle2, XCircle, AlertTriangle, Clock } from "lucide-react";
import { Badge } from "@/components/ui/badge";

export function ObsBadge({ status }: { status: string }) {
  switch (status) {
    case "OK":
      return (
        <Badge className="bg-emerald-500/10 text-emerald-600 dark:text-emerald-400 hover:bg-emerald-500/20 border-emerald-500/30 text-[11px] gap-1 py-0.5">
          <CheckCircle2 className="h-3 w-3" />
          OK
        </Badge>
      );
    case "FALTANTE":
      return (
        <Badge className="bg-rose-500/10 text-rose-600 dark:text-rose-400 hover:bg-rose-500/20 border-rose-500/30 text-[11px] gap-1 py-0.5">
          <XCircle className="h-3 w-3" />
          Faltante
        </Badge>
      );
    case "SOBRANTE":
      return (
        <Badge className="bg-amber-500/10 text-amber-600 dark:text-amber-400 hover:bg-amber-500/20 border-amber-500/30 text-[11px] gap-1 py-0.5">
          <AlertTriangle className="h-3 w-3" />
          Sobrante
        </Badge>
      );
    default:
      return (
        <Badge variant="secondary" className="text-[11px] gap-1 py-0.5">
          <Clock className="h-3 w-3" />
          Pendiente
        </Badge>
      );
  }
}
