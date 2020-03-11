class ArticlesController < ApplicationController

    def new
        @article = Article.new
    end

    def create 
        @article = Article.new(articles_params)
        @article.user_id = User.current_user
        @article.save

        if @article.save
            flash[:success] = "The article was successfully created"
            redirect_to article_path(@article)
        else 
            render 'new'
        end
    end

    def edit 
        @article = Article.find_by(id: params[:id])
    end
    # index
    def index 
        
        @articles  = Article.all
    end

    # show
   def show
       @article = Article.find_by(id: params[:id])
   end

    def update 
        @article = Article.find_by(id: params[:id])
        if @article.update(articles_params)
            flash[:success] = "Article was successfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def destroy 
        @article = Article.find_by(id: params[:id])
        @article.destroy
        redirect_to articles_path
        flash[:danger] = "The article was successfully destroy"
    end
    


private 
    def articles_params
        params.require(:article).permit(:title,:description)

    end

end