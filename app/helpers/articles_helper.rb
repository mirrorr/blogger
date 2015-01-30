module ArticlesHelper
    
    def article_params
        params.require(:article).permit(:title, :body)
        #params.require(:article).permit(:title)
        #params.require(:article).permit(:body)
    end
end
