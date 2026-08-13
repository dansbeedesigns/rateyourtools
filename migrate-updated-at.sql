-- Add updated_at column to reviews for tracking edits
ALTER TABLE reviews ADD COLUMN updated_at TIMESTAMP;
