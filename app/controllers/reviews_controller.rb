class ReviewsController < ApplicationController
  def index
    @reviews = Review.all

    @github = Github.new client_id: ENV["github_client_id"], client_secret:  ENV["github_client_secret"]
    @github1 = ""
    @github2 = ""
    @github3 = ""
    # @github4 = ""
    # @github5 = ""

    


    if params[:search] == nil
      puts "nothing searched"
    else
      @result = @github.search.repositories(params[:search]).response.body
      if @result.items[0]
        # @github.search.repositories(params[:search]).response.body.items[0]
        @github1 = @result.items[0].full_name 
        @github1_id = @result.items[0].id
      end      
      if @result.items[1]
        @github2 = @result.items[1].full_name
        @github2_id = @result.items[1].id
      end
      if @result.items[2]
        # binding.pry
        @github3 = @result.items[2].full_name
        @github3_id = @result.items[2].id
      end
    end

    # if @github.search.repositories(params[:search]).response.body.items[3]
    #   @github4 = @github.search.repositories(params[:search]).response.body.items[3].full_name
    # end

    # if @github.search.repositories(params[:search]).response.body.items[4]
    #   @github5 = @github.search.repositories(params[:search]).response.body.items[4].full_name
    # end

  end

  def show
    @review = Review.find(params[:id])
    # @reviews = Review.where(github_id: params[:github_id])

  end

  def show_for_repo
    @reviews = Review.where(github_id: params[:github_id])
  end

  def new
    @review = Review.new
  
    @reviews = Review.all

    @github = Github.new client_id: ENV["github_client_id"], client_secret:  ENV["github_client_secret"]
    @github_id = params[:github_id]
    @user = params[:user]
    # @github1 = ""
    @github2 = ""
    @github3 = ""
    # @github4 = ""
    # @github5 = ""

    


    if params[:search] == nil
      puts "nothing searched"
    else
      @result = @github.search.repositories(params[:search]).response.body
      if @result.items[0]
        # @github.search.repositories(params[:search]).response.body.items[0]
        @github1 = @result.items[0].full_name 
        @github1_id = @result.items[0].id
      end      
      if @result.items[1]
        @github2 = @result.items[1].full_name
        @github2_id = @result.items[1].id
      end
      if @result.items[2]
        # binding.pry
        @github3 = @result.items[2].full_name
        @github3_id = @result.items[2].id
      end
    end

  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  # def self.search(search)
  #   @github = Github.new client_id: ENV[github_client_id], client_secret:  ENV[github_client_secret]
  #   @github1 = @github.search.repositories(params[:search]).response.body.items[0].full_name
  #   @github2 = @github.search.repositories(params[:search]).response.body.items[1].full_name
  #   @github3 = @github.search.repositories(params[:search]).response.body.items[2].full_name
  #   @github4 = @github.search.repositories(params[:search]).response.body.items[3].full_name
  #   @github5 = @github.search.repositories(params[:search]).response.body.items[4].full_name
  # end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to review_path
    else
      render :new
    end
  end

  private
    
  def review_params
    params.require(:review).permit(:author, :title, :content, :star )
  end
end
