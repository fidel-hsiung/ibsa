class Good < ApplicationRecord

	validates_presence_of :consignment_id, :category, :name, :source, :entry_at
	validates_presence_of :exit_at, :destination, if: :left_facility?
  validates_uniqueness_of :consignment_id
	validates :left_facility, inclusion: {in: [true, false], message: "cannot be blank"}
	validate :time_valid?

  TABLE_HEADS = ['Consignment ID', 'Type', 'Name', 'Source', 'Destination', 'Entry At', 'Exit At']
  TABLE_BODYS = ['consignment_id', 'category', 'name', 'source', 'destination', 'entry_at_aus', 'exit_at_aus']

  def entry_at_aus
  	entry_at&.to_s(:time)
  end

  def exit_at_aus
  	exit_at&.to_s(:time)
  end

  private

  def time_valid?
  	return unless entry_at.present? && exit_at.present?
  	errors.add(:exit_at, 'cannot before entry at.') if exit_at < entry_at
  end
end
