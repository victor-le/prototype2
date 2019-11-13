require "application_system_test_case"

class InboxTablesTest < ApplicationSystemTestCase
  setup do
    @inbox_table = inbox_tables(:one)
  end

  test "visiting the index" do
    visit inbox_tables_url
    assert_selector "h1", text: "Inbox Tables"
  end

  test "creating a Inbox table" do
    visit inbox_tables_url
    click_on "New Inbox Table"

    click_on "Create Inbox table"

    assert_text "Inbox table was successfully created"
    click_on "Back"
  end

  test "updating a Inbox table" do
    visit inbox_tables_url
    click_on "Edit", match: :first

    click_on "Update Inbox table"

    assert_text "Inbox table was successfully updated"
    click_on "Back"
  end

  test "destroying a Inbox table" do
    visit inbox_tables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Inbox table was successfully destroyed"
  end
end
