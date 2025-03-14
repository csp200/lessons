-- Create a sample table
CREATE TABLE IF NOT EXISTS students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    major VARCHAR(50)
);

-- Insert sample data
INSERT INTO students (name, age, major) VALUES 
('Alice Johnson', 21, 'Computer Science'),
('Bob Smith', 22, 'Mathematics'),
('Charlie Brown', 20, 'Physics');
