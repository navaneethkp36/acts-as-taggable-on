# frozen_string_literal: true

class AddTenantToTags < ActiveRecord::Migration[6.0]
  def self.up
    add_column ActsAsTaggableOn.tags_table, :tenant, :string, limit: 128
    add_index ActsAsTaggableOn.tags_table, :tenant unless index_exists? ActsAsTaggableOn.tags_table, :tenant
  end

  def self.down
    remove_index ActsAsTaggableOn.tags_table, :tenant
    remove_column ActsAsTaggableOn.tags_table, :tenant
  end
end
