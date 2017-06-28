class ArticlesController < ApplicationController

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(article_params)
        if @article.save
            flash[notice:] = "Successful publication"
            redirect_to articles_path
            
        else
            render "new"
        end
        #render plain: params[:article].inspect
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def
    @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Post edited"
            redirect_to article_path(@article)
        else
            render "edit"
        end
    
    private
    def article_params
        params.require(:article).permit(:title, :dscription)
    end
end
