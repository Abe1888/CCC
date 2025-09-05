/*
  # Initial GPS Installation Management Schema

  1. New Tables
    - `vehicles` - Vehicle information and installation status
    - `locations` - Installation locations with capacity info
    - `team_members` - Installation team members and their stats
    - `tasks` - Individual tasks for vehicle installations
    - `project_settings` - Project configuration and settings
    - `comments` - Task comments and notes

  2. Security
    - Enable RLS on all tables
    - Add policies for public access (demo purposes)
*/

-- Create vehicles table
CREATE TABLE IF NOT EXISTS vehicles (
  id text PRIMARY KEY,
  type text NOT NULL,
  location text NOT NULL,
  day integer NOT NULL,
  time_slot text NOT NULL,
  status text NOT NULL DEFAULT 'Pending' CHECK (status IN ('Pending', 'In Progress', 'Completed')),
  gps_required integer NOT NULL DEFAULT 1,
  fuel_sensors integer NOT NULL DEFAULT 1,
  fuel_tanks integer NOT NULL DEFAULT 1,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Create locations table
CREATE TABLE IF NOT EXISTS locations (
  name text PRIMARY KEY,
  duration text NOT NULL,
  vehicles integer NOT NULL DEFAULT 0,
  gps_devices integer NOT NULL DEFAULT 0,
  fuel_sensors integer NOT NULL DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

-- Create team_members table
CREATE TABLE IF NOT EXISTS team_members (
  id text PRIMARY KEY,
  name text NOT NULL,
  role text NOT NULL,
  specializations text[] DEFAULT '{}',
  completion_rate integer DEFAULT 0,
  average_task_time integer DEFAULT 0,
  quality_score integer DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

-- Create tasks table
CREATE TABLE IF NOT EXISTS tasks (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  vehicle_id text NOT NULL REFERENCES vehicles(id) ON DELETE CASCADE,
  name text NOT NULL,
  description text,
  status text NOT NULL DEFAULT 'Pending' CHECK (status IN ('Pending', 'In Progress', 'Completed', 'Blocked')),
  assigned_to text NOT NULL,
  priority text NOT NULL DEFAULT 'Medium' CHECK (priority IN ('High', 'Medium', 'Low')),
  estimated_duration integer,
  start_date date,
  end_date date,
  duration_days integer DEFAULT 1,
  notes text,
  tags text[] DEFAULT '{}',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Create project_settings table
CREATE TABLE IF NOT EXISTS project_settings (
  id text PRIMARY KEY DEFAULT 'default',
  project_start_date date NOT NULL DEFAULT CURRENT_DATE,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Create comments table
CREATE TABLE IF NOT EXISTS comments (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  task_id uuid NOT NULL REFERENCES tasks(id) ON DELETE CASCADE,
  text text NOT NULL,
  author text NOT NULL,
  created_at timestamptz DEFAULT now()
);

-- Enable Row Level Security
ALTER TABLE vehicles ENABLE ROW LEVEL SECURITY;
ALTER TABLE locations ENABLE ROW LEVEL SECURITY;
ALTER TABLE team_members ENABLE ROW LEVEL SECURITY;
ALTER TABLE tasks ENABLE ROW LEVEL SECURITY;
ALTER TABLE project_settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE comments ENABLE ROW LEVEL SECURITY;

-- Create policies for public access (demo purposes)
CREATE POLICY "Public access" ON vehicles FOR ALL USING (true);
CREATE POLICY "Public access" ON locations FOR ALL USING (true);
CREATE POLICY "Public access" ON team_members FOR ALL USING (true);
CREATE POLICY "Public access" ON tasks FOR ALL USING (true);
CREATE POLICY "Public access" ON project_settings FOR ALL USING (true);
CREATE POLICY "Public access" ON comments FOR ALL USING (true);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_vehicles_location ON vehicles(location);
CREATE INDEX IF NOT EXISTS idx_vehicles_day ON vehicles(day);
CREATE INDEX IF NOT EXISTS idx_vehicles_status ON vehicles(status);
CREATE INDEX IF NOT EXISTS idx_tasks_vehicle_id ON tasks(vehicle_id);
CREATE INDEX IF NOT EXISTS idx_tasks_status ON tasks(status);
CREATE INDEX IF NOT EXISTS idx_tasks_assigned_to ON tasks(assigned_to);
CREATE INDEX IF NOT EXISTS idx_comments_task_id ON comments(task_id);

-- Insert default project settings
INSERT INTO project_settings (id, project_start_date) 
VALUES ('default', CURRENT_DATE)
ON CONFLICT (id) DO NOTHING;