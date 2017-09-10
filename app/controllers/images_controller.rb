class ImagesController < ApplicationController
  def index
    @users = User.all 
    @images = Image.all.reverse
    render "index.html.erb"
  end

  def litpics
    @users = User.all 
    @images = Image.all.reverse
    render "litpics.html.erb"
  end
  
  def new
    @user = User.find_by(params[:id])
    render "new.html.erb"
  end  
  
  def create
    image = Image.new(
      title: params[:title],
      url: params[:url],
      description: params[:description],
      user_id: current_user.id
    )
    image.save
    redirect_to "/images"
  end

  def show
    @image = Image.find_by(id: params[:id])
    image_path = (Rails.root.to_s + '/public' + @image.url.url(:original)).split("?")[0]
    encoded_image = Base64.encode64(open(image_path) { |io| io.read })
    @temp = ENV['IMAGE_API_KEY']
    # @data = encoded_image
    response = Unirest.post(
      "https://api.clarifai.com/v2/models/aaa03c23b3724a16a56b629203edc62c/outputs",
      headers: {"Authorization" => "Key #{ENV['IMAGE_API_KEY']}", "Content-Type" => "application/json"},
      parameters: {
        "inputs" => [
          {
            "data" => {
              "image" => {
                # "url" => "https://static.pexels.com/photos/7720/night-animal-dog-pet.jpg"
                "base64" => encoded_image
              }
            }
          }
        ]
      }.to_json
    )
    @data = response.body

    @names = @data["outputs"][0]["data"]["concepts"].map { |concept| concept["name"] }
    @names = @names[0..9]
    if @names.include? "bed" 
      @message = "GET OUT OF BED"
    elsif @names.include? "dog"
      @message = "NOT MY DOG"
    elsif @names.include? "nude"
      @message = "PUT SOME DAMN CLOTHES ON"
    elsif @names.include? "cat"
      @message = "GOT DAMN CAT"
    elsif @names.include? "money"
      @message = "GIVE ERIC SOME"
    elsif @names.include? "Squad"
      @message = "SQUAADDDD"
    elsif (@names & ["party", "crowd", "nightclub", "performance", "concert", "supercar", "celebration", "fashion"]).length > 0
      @message = "THIS PIC IS LIT"
    elsif @names.include? "car"
      @message = "NICE CAR"
    elsif @names.include? "wedding"
      @message = "CONGRATULATIONS!!!!"
    elsif @names.include? "fire"
      @message = "THATS HOT!!!!"
    elsif @names.include? "baby"
      @message = "BABIES ARE AWSOME!!!!"
    elsif @names.include? "food"
      @message = "THAT LOOKS GOOD!!!!"
    elsif @names.include? "house"
      @message = "NICE HOME!!!!"
    elsif @names.include? "bus"
      @message = "NICE BUS!!!!"
    elsif @names
      @message = "NOT LIT AT ALL"  
    end
    render "show.html.erb"
  end

  def edit
  end

  def update
  end

  def destroy
    @image = Image.find_by(id: params[:id])
    @image.delete
    redirect_to "/users"
  end
end

