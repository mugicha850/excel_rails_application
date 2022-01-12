module ApplicationHelper
    def document_title
        if @title.present?
            "#{@title} - かけだしアプリ"
        else
            "かけだしアプリ"
        end
    end
end
