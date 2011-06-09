class AddANoteToKogswell < ActiveRecord::Migration
  def self.up
    Note.create(:note => "Fork is 'mid-trail' in the sense that it's the middle trail offering that Kogswell had.  It's a low trail fork.  I have a photograph of the steerer tube with the offset inscribed on it.  I think it puts the trail around 40mm.", :bike_id => Bike.find_by_slug('kogswell_pr').id)
  end

  def self.down
  end
end
