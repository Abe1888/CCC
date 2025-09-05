/*
  # Sample Data for GPS Installation Management

  1. Sample Data
    - Insert sample vehicles across different locations
    - Insert location information
    - Insert team members
    - Insert sample tasks

  2. Data Structure
    - 24 vehicles across 3 locations
    - 14-day project timeline
    - Realistic installation scenarios
*/

-- Insert locations
INSERT INTO locations (name, duration, vehicles, gps_devices, fuel_sensors) VALUES
('Bahir Dar', '8 days', 15, 15, 18),
('Kombolcha', '3 days', 6, 6, 8),
('Addis Ababa', '2 days', 3, 3, 4)
ON CONFLICT (name) DO UPDATE SET
  duration = EXCLUDED.duration,
  vehicles = EXCLUDED.vehicles,
  gps_devices = EXCLUDED.gps_devices,
  fuel_sensors = EXCLUDED.fuel_sensors;

-- Insert team members
INSERT INTO team_members (id, name, role, specializations, completion_rate, average_task_time, quality_score) VALUES
('TM001', 'Ahmed Hassan', 'Senior Technician', '{"GPS Installation", "Fuel Sensors", "System Configuration"}', 95, 45, 98),
('TM002', 'Sarah Johnson', 'Installation Specialist', '{"GPS Installation", "Vehicle Diagnostics"}', 92, 50, 94),
('TM003', 'Michael Chen', 'Technical Lead', '{"System Configuration", "Quality Assurance", "Training"}', 98, 40, 99),
('TM004', 'Fatima Al-Rashid', 'Field Technician', '{"Fuel Sensors", "Calibration"}', 88, 55, 91),
('TM005', 'David Rodriguez', 'Installation Technician', '{"GPS Installation", "Documentation"}', 90, 48, 93)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  role = EXCLUDED.role,
  specializations = EXCLUDED.specializations,
  completion_rate = EXCLUDED.completion_rate,
  average_task_time = EXCLUDED.average_task_time,
  quality_score = EXCLUDED.quality_score;

-- Insert vehicles for Bahir Dar (Days 1-8)
INSERT INTO vehicles (id, type, location, day, time_slot, status, gps_required, fuel_sensors, fuel_tanks) VALUES
-- Day 1
('BD001', 'Isuzu NPR', 'Bahir Dar', 1, '08:00-10:00', 'Pending', 1, 1, 1),
('BD002', 'Mitsubishi Canter', 'Bahir Dar', 1, '10:30-12:30', 'Pending', 1, 1, 1),
-- Day 2
('BD003', 'Isuzu ELF', 'Bahir Dar', 2, '08:00-10:00', 'Pending', 1, 2, 2),
('BD004', 'Hino Dutro', 'Bahir Dar', 2, '10:30-12:30', 'Pending', 1, 1, 1),
-- Day 3
('BD005', 'Mitsubishi Fuso', 'Bahir Dar', 3, '08:00-10:00', 'Pending', 1, 1, 1),
('BD006', 'Isuzu Forward', 'Bahir Dar', 3, '10:30-12:30', 'Pending', 1, 2, 2),
-- Day 4
('BD007', 'Hino Ranger', 'Bahir Dar', 4, '08:00-10:00', 'Pending', 1, 1, 1),
('BD008', 'Mitsubishi Canter', 'Bahir Dar', 4, '10:30-12:30', 'Pending', 1, 1, 1),
-- Day 5
('BD009', 'Isuzu NPR', 'Bahir Dar', 5, '08:00-10:00', 'Pending', 1, 2, 2),
('BD010', 'Hino Dutro', 'Bahir Dar', 5, '10:30-12:30', 'Pending', 1, 1, 1),
-- Day 6
('BD011', 'Mitsubishi Fuso', 'Bahir Dar', 6, '08:00-10:00', 'Pending', 1, 1, 1),
('BD012', 'Isuzu ELF', 'Bahir Dar', 6, '10:30-12:30', 'Pending', 1, 1, 1),
-- Day 7
('BD013', 'Hino Ranger', 'Bahir Dar', 7, '08:00-10:00', 'Pending', 1, 2, 2),
('BD014', 'Mitsubishi Canter', 'Bahir Dar', 7, '10:30-12:30', 'Pending', 1, 1, 1),
-- Day 8
('BD015', 'Isuzu Forward', 'Bahir Dar', 8, '08:00-10:00', 'Pending', 1, 1, 1)
ON CONFLICT (id) DO UPDATE SET
  type = EXCLUDED.type,
  location = EXCLUDED.location,
  day = EXCLUDED.day,
  time_slot = EXCLUDED.time_slot,
  gps_required = EXCLUDED.gps_required,
  fuel_sensors = EXCLUDED.fuel_sensors,
  fuel_tanks = EXCLUDED.fuel_tanks;

-- Insert vehicles for Kombolcha (Days 10-12)
INSERT INTO vehicles (id, type, location, day, time_slot, status, gps_required, fuel_sensors, fuel_tanks) VALUES
-- Day 10
('KB001', 'Isuzu NPR', 'Kombolcha', 10, '08:00-10:00', 'Pending', 1, 1, 1),
('KB002', 'Mitsubishi Canter', 'Kombolcha', 10, '10:30-12:30', 'Pending', 1, 2, 2),
-- Day 11
('KB003', 'Hino Dutro', 'Kombolcha', 11, '08:00-10:00', 'Pending', 1, 1, 1),
('KB004', 'Isuzu ELF', 'Kombolcha', 11, '10:30-12:30', 'Pending', 1, 2, 2),
-- Day 12
('KB005', 'Mitsubishi Fuso', 'Kombolcha', 12, '08:00-10:00', 'Pending', 1, 1, 1),
('KB006', 'Hino Ranger', 'Kombolcha', 12, '10:30-12:30', 'Pending', 1, 1, 1)
ON CONFLICT (id) DO UPDATE SET
  type = EXCLUDED.type,
  location = EXCLUDED.location,
  day = EXCLUDED.day,
  time_slot = EXCLUDED.time_slot,
  gps_required = EXCLUDED.gps_required,
  fuel_sensors = EXCLUDED.fuel_sensors,
  fuel_tanks = EXCLUDED.fuel_tanks;

-- Insert vehicles for Addis Ababa (Days 13-14)
INSERT INTO vehicles (id, type, location, day, time_slot, status, gps_required, fuel_sensors, fuel_tanks) VALUES
-- Day 13
('AA001', 'Isuzu Forward', 'Addis Ababa', 13, '08:00-10:00', 'Pending', 1, 2, 2),
('AA002', 'Mitsubishi Canter', 'Addis Ababa', 13, '10:30-12:30', 'Pending', 1, 1, 1),
-- Day 14
('AA003', 'Hino Dutro', 'Addis Ababa', 14, '08:00-10:00', 'Pending', 1, 1, 1)
ON CONFLICT (id) DO UPDATE SET
  type = EXCLUDED.type,
  location = EXCLUDED.location,
  day = EXCLUDED.day,
  time_slot = EXCLUDED.time_slot,
  gps_required = EXCLUDED.gps_required,
  fuel_sensors = EXCLUDED.fuel_sensors,
  fuel_tanks = EXCLUDED.fuel_tanks;