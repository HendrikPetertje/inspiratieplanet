module ApplicationHelper
end

def render_title
  return @title if defined?(@title)
  "Inspiratieplanet"
end

def render_subtitle
  return @subtitle if defined?(@subtitle)
  " "
end

