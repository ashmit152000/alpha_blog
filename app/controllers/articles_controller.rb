class ArticlesController < ApplicationController
    before_action :find_user, only:[:edit,:show,:update,:destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    def new
        @article = Article.new

    end

    def create 
        @article = Article.new(articles_params)
        @article.user_id = current_user.id
        @article.save

        if @article.save
            flash[:success] = "The article was successfully created"
            redirect_to article_path(@article)
        else 
            render 'new'
        end
    end

    def edit 
        
    end
    # index
    def index 
        
        @articles  = Article.paginate(page: params[:page], per_page: 5)
    end

    # show
   def show
     
   end

    def update 
        
        
        if @article.update(articles_params)

            flash[:success] = "Article was successfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'

        end
    end

    def destroy 
        
        @article.destroy
        redirect_to articles_path
        flash[:danger] = "The article was successfully destroy"
    end
    

def require_same_user
        if current_user != @article.user
            flash[:danger] = 'You can only edit or delete your articles'
            redirect_to article_path(@article)
        end
end

def find_user
    @article = Article.find_by(id: params[:id])
end

private 
    def articles_params
        params.require(:article).permit(:title,:description)

    end

   

end