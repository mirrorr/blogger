class ArticlesController < ApplicationController
    include ArticlesHelper
    def index
        @articles = Article.all
    end
    def show
        @article = Article.find(params[:id])
    end
    def new
        @article = Article.new
    end
    def create
        #@article = Article.new(article_params)
        @article = Article.new
        @article.title = params[:article][:title]
        @article.body = params[:article][:body]
        @article.save
        flash.notice = "New article '#{@article.title}' created!"
        redirect_to article_path(@article)
    end
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash.notice = "Article '#{@article.title}' deleted!"
        redirect_to articles_path
    end
    def edit
       @article = Article.find(params[:id]) 
    end
    def update
      @article = Article.find(params[:id])
      @article.title = params[:article][:title]
      @article.body = params[:article][:body]
      @article.save        
      #@article.update(@article.title, @article.body)
      #@article.update(article_params) - http://stackoverflow.com/questions/16468487/rails-4-strong-params-error-no-implicit-conversion-of-symbol-into-string
      #Article.update( params[:id], params[:article][:title], params[:article][:body])    
      # for rails <4  - http://stackoverflow.com/questions/27199089/private-method-update-called-for-customer
       # @article.update_attributes( :body => params[:article][:body])
      flash.notice = "Article '#{@article.title}' Updated!"
      redirect_to article_path(@article)
    end
end
