declare module 'mssql' {
  export interface config {
    user?: string;
    password?: string;
    server: string;
    database?: string;
    connectionTimeout?: number;
    requestTimeout?: number;
    options?: {
      encrypt?: boolean;
      trustServerCertificate?: boolean;
      enableArithAbort?: boolean;
      instanceName?: string;
    };
    pool?: {
      max?: number;
      min?: number;
      idleTimeoutMillis?: number;
    };
  }

  export interface IResult<T = Record<string, unknown>> {
    recordset: T[];
    recordsets: T[][];
    rowsAffected: number[];
    output: Record<string, unknown>;
  }

  export interface Request {
    input(name: string, type: unknown, value?: unknown): Request;
    output(name: string, type: unknown): Request;
    query<T = Record<string, unknown>>(command: string): Promise<IResult<T>>;
    execute<T = Record<string, unknown>>(procedure: string): Promise<IResult<T>>;
  }

  export interface Transaction {
    begin(isolationLevel?: string): Transaction;
    commit(): Promise<void>;
    rollback(): Promise<void>;
    request(): Request;
  }

  export interface ConnectionPool {
    connect(): Promise<ConnectionPool>;
    close(): Promise<void>;
    request(): Request;
    transaction(): Transaction;
    connected: boolean;
    connecting: boolean;
    pool: unknown;
  }

  export class ConnectionPool {
    constructor(config: config | string);
    connect(): Promise<ConnectionPool>;
    close(): Promise<void>;
    request(): Request;
    transaction(): Transaction;
    connected: boolean;
    connecting: boolean;
    pool: unknown;
  }

  export default class mssql {
    static connect(config: config | string): Promise<ConnectionPool>;
    static ConnectionPool: typeof ConnectionPool;
  }
}
