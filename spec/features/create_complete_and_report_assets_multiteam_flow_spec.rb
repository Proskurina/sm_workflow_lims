# frozen_string_literal: true
require 'rails_helper'

feature 'create complete and report assets within multi team flow', js: true do

  let!(:asset_type) { create(:asset_type, name: 'Tube', identifier_type: 'ID') }
  let!(:workflow1) { create(:multi_team_workflow, name: 'Multi team workflow') }
  let!(:workflow2) { create(:multi_team_workflow_reportable, name: 'Reportable multi team workflow') }
  let!(:workflow3) { create(:workflow, name: 'Workflow') }
  let!(:in_progress) { create :state, name: 'in_progress' }
  let!(:volume_check) { create :state, name: 'volume_check' }
  let!(:quant) { create :state, name: 'quant' }
  let!(:report_required) { create :state, name: 'report_required' }
  let!(:completed) { create :state, name: 'completed' }
  let!(:reported) { create :state, name: 'reported' }

  scenario 'can create and complete a non-reportable asset' do
    visit '/'
    click_link 'New Batch'
    click_on 'Tube'
    within("div#tube-template") do
      fill_in 'identifier', with: 123
    end
    click_on 'Append to batch'
    within("div#tube-template") do
      fill_in 'identifier', with: 456
    end
    click_on 'Append to batch'
    expect(page).to have_content "Asset added to the batch"
    fill_in 'Study', with: 'STDY'
    select('Multi team workflow', from: 'Workflow')
    click_on 'Save'
    expect(page).to have_content "The batch was created."
    click_on 'Sample management'
    click_on 'In progress'
    expect(page).not_to have_selector('table tr')
    click_on 'Multi team quant essential'
    click_on 'Volume check'
    expect(page).to have_selector('table tr', count: 3)
    check "assets[#{Asset.first.id}]"
    click_on 'Volume checked selected'
    expect(page).to have_content "Volume check is done for 123"
    expect(page).to have_selector('table tr', count: 2)
    click_on 'Quant'
    expect(page).to have_selector('table tr', count: 2)
    check "assets[#{Asset.first.id}]"
    click_on 'Completed selected'
    expect(page).to have_content "Quant is done for 123"
    expect(page).not_to have_selector('table tr')
    click_on 'Report required'
    expect(page).not_to have_selector('table tr')
    click_on 'Sample management'
    click_on 'Report required'
    expect(page).not_to have_selector('table tr')
  end

  scenario 'can create, complete and report a reportable asset' do
    visit '/'
    click_link 'New Batch'
    click_on 'Tube'
    within("div#tube-template") do
      fill_in 'identifier', with: 123
    end
    click_on 'Append to batch'
    within("div#tube-template") do
      fill_in 'identifier', with: 456
    end
    click_on 'Append to batch'
    within("div#tube-template") do
      fill_in 'identifier', with: 789
    end
    click_on 'Append to batch'
    expect(page).to have_content "Asset added to the batch"
    fill_in 'Study', with: 'STDY'
    select('Reportable multi team workflow', from: 'Workflow')
    click_on 'Save'
    expect(page).to have_content "The batch was created."
    click_on 'Sample management'
    click_on 'In progress'
    expect(page).not_to have_selector('table tr')
    click_on 'Multi team quant essential'
    click_on 'Volume check'
    expect(page).to have_selector('table tr', count: 4)
    check "assets[#{Asset.first.id}]"
    check "assets[#{Asset.third.id}]"
    click_on 'Volume checked selected'
    expect(page).to have_content "Volume check is done for 123 and 789"
    expect(page).to have_selector('table tr', count: 2)
    click_on 'Quant'
    expect(page).to have_selector('table tr', count: 3)
    check "assets[#{Asset.third.id}]"
    click_on 'Completed selected'
    expect(page).to have_content "Quant is done for 789"
    expect(page).to have_selector('table tr', count: 2)
    click_on 'Sample management'
    click_on 'Report required'
    expect(page).not_to have_selector('table tr')
    click_on 'Multi team quant essential'
    click_on 'Report required'
    expect(page).to have_selector('table tr', count: 2)
    check "assets[#{Asset.third.id}]"
    click_on 'Reported selected'
    expect(page).to have_content "Report required is done for 789"
    expect(page).not_to have_selector('table tr')
  end

end