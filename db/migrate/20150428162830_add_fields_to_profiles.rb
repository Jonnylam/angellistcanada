class AddFieldsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :story, :text
    add_column :profiles, :product_overview, :text
    add_column :profiles, :company_stage, :text
    add_column :profiles, :year_founded, :text
    add_column :profiles, :number_of_employees, :text
    add_column :profiles, :pitch_video, :string
 
    add_column :profiles, :advisors, :text
    add_column :profiles, :previous_investors, :text
    add_column :profiles, :founders, :text
    add_column :profiles, :management_team, :text
    add_column :profiles, :management_experience, :text
    add_column :profiles, :customer_problem, :text
    add_column :profiles, :other_products, :text
    add_column :profiles, :target_market, :text
    add_column :profiles, :customers, :text
    
  end
end
