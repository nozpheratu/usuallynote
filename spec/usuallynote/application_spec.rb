describe UsuallyNote::Application do

  it 'gets instantiated with a new window object' do
    app = UsuallyNote::Application.new
    expect(app.window).not_to be_nil
  end

end
