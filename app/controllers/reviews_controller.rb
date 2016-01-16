class ReviewsController < ApplicationController
  def index
    @github = Github.new client_id: ENV["github_client_id"], client_secret:  ENV["github_client_secret"]
    @github1 = ""
    @github2 = ""
    @github3 = ""
    # @github4 = ""
    # @github5 = ""

    if @github.search.repositories(params[:search]).response.body.items[0]
      @github1 = @github.search.repositories(params[:search]).response.body.items[0].full_name
    end

    if @github.search.repositories(params[:search]).response.body.items[1]
      @github2 = @github.search.repositories(params[:search]).response.body.items[1].full_name
    end

    if @github.search.repositories(params[:search]).response.body.items[2]
      @github3 = @github.search.repositories(params[:search]).response.body.items[2].full_name
    end

    # if @github.search.repositories(params[:search]).response.body.items[3]
    #   @github4 = @github.search.repositories(params[:search]).response.body.items[3].full_name
    # end

    # if @github.search.repositories(params[:search]).response.body.items[4]
    #   @github5 = @github.search.repositories(params[:search]).response.body.items[4].full_name
    # end

  end

  def show
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

  def new
  end
end
