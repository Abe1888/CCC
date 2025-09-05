'use client'

import React from 'react'
import { SWRConfig } from 'swr'
import { ErrorBoundary } from '@/components/ui/ErrorBoundary'
import { ConnectionGuard } from '@/components/ui/ConnectionGuard'

// SWR configuration for optimal performance
const swrConfig = {
  revalidateOnFocus: false,
  revalidateOnReconnect: true,
  refreshInterval: 30000, // 30 seconds
  dedupingInterval: 5000, // 5 seconds
  errorRetryCount: 3,
  errorRetryInterval: 1000,
  loadingTimeout: 10000,
  focusThrottleInterval: 5000,
}

export function Providers({ children }: { children: React.ReactNode }) {
  return (
    <ErrorBoundary>
      <ConnectionGuard>
        <SWRConfig value={swrConfig}>
          {children}
        </SWRConfig>
      </ConnectionGuard>
    </ErrorBoundary>
  )
}