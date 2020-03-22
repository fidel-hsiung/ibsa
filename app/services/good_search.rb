class GoodSearch
  include ActiveModel::Model

  attr_accessor :category, :name, :source, :destination, :consignment_id, :entry_at_day, :exit_at_day, :left_facility

  def records
    goods = Good.all

    if category.present?
      goods = goods.where("category = ?", category.strip)
    end

    if name.present?
      goods = goods.where("name ilike ?", "%#{name.strip}%")
    end

    if source.present?
      goods = goods.where("source = ?", source.strip)
    end

    if destination.present?
      goods = goods.where("destination = ?", destination.strip)
    end

    if consignment_id.present?
      goods = goods.where("consignment_id = ?", consignment_id.strip)
    end

    if entry_at_day.present?
      entry_day = entry_at_day.to_date
      goods = goods.where("entry_at >= ? AND entry_at <= ?", entry_day.beginning_of_day, entry_day.end_of_day)
    end

    if exit_at_day.present?
      exit_day = exit_at_day.to_date
      goods = goods.where("exit_at >= ? AND exit_at <= ?", exit_day.beginning_of_day, exit_day.end_of_day)
    end

    unless left_facility.blank?
      goods = goods.where("left_facility = ?", left_facility_value)
    end

    goods
  end

  private
  def left_facility_value
    return nil if @left_facility.blank?
    @left_facility == 'true' ? true : false
  end
end