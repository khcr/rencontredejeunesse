Given("I am a visitor") do
end

Given("I am a confirmed user") do
  @user = create(:user)
end

Given("I am signed in") do
  visit signin_path
  fill_in "Email", with: "john@smith.com"
  fill_in "Mot de passe", with: "carottes"
  click_button "Se connecter"
end

When("I visit {string}") do |path|
	visit path
end

When("I click the button {string}") do |button|
  click_button button
end

When("I miscomplete the form") do
  find("form").find("button[type=submit]").click
end

Then("I should see a flash with {string}") do |message|
	expect(find '#flash').to have_content(message)
end

Then("I should see errors for the fields {string}") do |fields|
	fields.split(",").each do |field|
		expect(find '#error').to have_content field
	end
end