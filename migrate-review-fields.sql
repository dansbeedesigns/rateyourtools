-- RateYourTools.org — Migration: reviewer context fields
-- Run once against the existing production database:
--   wrangler d1 execute rateyourtools-db --remote --file=migrate-review-fields.sql
--
-- All columns are nullable so existing reviews are unaffected.

ALTER TABLE reviews ADD COLUMN experience_level   TEXT;
ALTER TABLE reviews ADD COLUMN woodworker_type    TEXT;
ALTER TABLE reviews ADD COLUMN shop_setting       TEXT;
ALTER TABLE reviews ADD COLUMN ownership_duration TEXT;
ALTER TABLE reviews ADD COLUMN bought_new         INTEGER;
ALTER TABLE reviews ADD COLUMN usage_frequency    TEXT;
ALTER TABLE reviews ADD COLUMN would_buy_again    TEXT;
