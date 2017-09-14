class ImagesController < ApplicationController
  def index
    @users = User.all 
    @images = Image.all.reverse
    @grouped_images = @images.group_by { |image| image.message }
    render "index.html.erb"
  end

  def litpics
    @users = User.all 
    @images = Image.all.reverse
    @grouped_images = Image.where(message: "THIS PIC IS LIT")
    render "litpics.html.erb"
  end

   def notlitpics
    @users = User.all 
    @images = Image.all.reverse
    @grouped_images = Image.where(message: "THIS PIC IS NOT LIT AT ALL")
    render "notlitpics.html.erb"
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
      @message = "THIS PIC IS NOT LIT AT ALL"
    elsif (@names & ["party", "crowd", "nightclub", "performance", "concert", "group", "supercar", "facial expression", "success", "celebration", "accomplishment", "fashion"]).length > 0
      @message = "THIS PIC IS LIT"
    elsif @names
      @message = "THIS PIC IS NOT LIT AT ALL"  
    end
    @image.update(message: @message)
    render "show.html.erb"
  end

  def edit
  end

  def update
  end

  def destroy
    @image = Image.find_by(id: params[:id])
    @image.delete
    redirect_to "/profile"
  end

  def search
    search = params[:search_terms]
    @images = Image.where("title iLIKE ?", "%#{search}%" )
    render "index.html.erb"  
  end  
end

