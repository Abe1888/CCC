'use client'

import React from 'react'
import { ProjectStats } from './ProjectStats'
import { LocationOverview } from './LocationOverview'
import { ProjectCountdown } from '../ui/ProjectCountdown'
import { useProjectSettings } from '@/lib/hooks/useSupabase'

export function Dashboard() {
  const { projectSettings } = useProjectSettings()
  const currentStartDate = projectSettings?.project_start_date || new Date().toISOString().split('T')[0]

  return (
    <div className="space-y-8">
      {/* Header */}
      <div>
        <h1 className="text-2xl font-bold text-gray-900">Dashboard</h1>
        <p className="text-gray-600">
          Monitor project progress and manage installation schedules
        </p>
      </div>

      {/* Project Countdown */}
      <ProjectCountdown 
        startDate={currentStartDate}
        onCountdownComplete={() => console.log('Project started!')}
      />

      {/* Main Content Grid */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
        <ProjectStats />
        <LocationOverview />
      </div>
    </div>
  )
}