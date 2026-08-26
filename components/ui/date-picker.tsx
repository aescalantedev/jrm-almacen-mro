"use client";

import * as React from "react";
import { format, parse, isValid } from "date-fns";
import { es } from "date-fns/locale";
import { Calendar as CalendarIcon, X } from "lucide-react";
import { cn } from "@/lib/utils";
import { Button } from "@/components/ui/button";
import { Calendar } from "@/components/ui/calendar";
import {
  Popover,
  PopoverContent,
  PopoverTrigger,
} from "@/components/ui/popover";

export interface DatePickerProps {
  value?: string; // YYYY-MM-DD
  onChange: (value: string) => void;
  placeholder?: string;
  className?: string;
  title?: string;
}

export function DatePicker({
  value,
  onChange,
  placeholder = "dd/mm/aaaa",
  className,
  title,
}: DatePickerProps) {
  const [open, setOpen] = React.useState(false);

  // Parse YYYY-MM-DD string to Date object
  const selectedDate = React.useMemo(() => {
    if (!value) return undefined;
    const parsed = parse(value, "yyyy-MM-dd", new Date());
    return isValid(parsed) ? parsed : undefined;
  }, [value]);

  const handleSelect = (date: Date | undefined) => {
    if (date) {
      onChange(format(date, "yyyy-MM-dd"));
    } else {
      onChange("");
    }
    setOpen(false);
  };

  const handleClear = (e: React.MouseEvent) => {
    e.stopPropagation();
    onChange("");
  };

  return (
    <Popover open={open} onOpenChange={setOpen}>
      <PopoverTrigger asChild>
        <Button
          variant="outline"
          title={title}
          className={cn(
            "w-full h-10 justify-between text-left font-normal text-xs rounded-xl border-input bg-background hover:bg-secondary/40 hover:text-foreground",
            !selectedDate && "text-muted-foreground",
            className
          )}
        >
          <div className="flex items-center gap-2 truncate">
            <CalendarIcon className="h-3.5 w-3.5 text-muted-foreground shrink-0" />
            <span className="truncate">
              {selectedDate ? (
                format(selectedDate, "dd/MM/yyyy", { locale: es })
              ) : (
                placeholder
              )}
            </span>
          </div>

          {selectedDate && (
            <div
              role="button"
              tabIndex={0}
              onClick={handleClear}
              onKeyDown={(e) => e.key === "Enter" && handleClear(e as unknown as React.MouseEvent)}
              className="p-1 rounded-full text-muted-foreground hover:text-foreground hover:bg-muted transition-colors ml-1 shrink-0"
              title="Borrar fecha"
            >
              <X className="h-3 w-3" />
            </div>
          )}
        </Button>
      </PopoverTrigger>
      <PopoverContent className="w-auto p-0 rounded-2xl border border-border shadow-xl z-50" align="start">
        <Calendar
          mode="single"
          selected={selectedDate}
          onSelect={handleSelect}
          locale={es}
          className="p-3"
        />
        <div className="flex items-center justify-between p-2.5 border-t border-border/50 bg-secondary/20">
          <Button
            type="button"
            variant="ghost"
            size="sm"
            onClick={() => {
              onChange("");
              setOpen(false);
            }}
            className="text-[11px] h-7 text-muted-foreground hover:text-foreground"
          >
            Limpiar
          </Button>
          <Button
            type="button"
            variant="ghost"
            size="sm"
            onClick={() => {
              onChange(format(new Date(), "yyyy-MM-dd"));
              setOpen(false);
            }}
            className="text-[11px] h-7 text-primary font-bold hover:text-primary/80"
          >
            Hoy
          </Button>
        </div>
      </PopoverContent>
    </Popover>
  );
}
