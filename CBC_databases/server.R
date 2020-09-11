
library(shiny)

shinyServer(function(input, output) {
    
    output$cactus_num = renderText(c("Number of files available: ", length(list.files("cactus/"))))
    output$citrus_num = renderText(c("Number of files available: ", length(list.files("citrus/"))))
    output$grasses_num = renderText(c("Number of files available: ", length(list.files("grasses/"))))
    output$waterweeds_num = renderText(c("Number of files available: ", length(list.files("waterweeds/"))))
    output$other_num = renderText(c("Number of files available: ", length(list.files("other/"))))
    
    # get the file name selected by the user
    getcactus <- reactive(basename(input$cactus_database))
    getcitrus = reactive(basename(input$citrus_database))
    getgrasses = reactive(basename(input$grasses_database))
    getother = reactive(basename(input$other_database))
    getwaterweeds = reactive(basename(input$waterweeds_database))
    
    # Download selected cactus database
    output$download_cactus <- downloadHandler(
        filename = function() {
            paste(input$cactus_database)
        },
        content = function(file) {
            file.copy(paste("cactus/", getcactus(), sep=""), file)
        })
    
    # Download selected citrus database
    output$download_citrus <- downloadHandler(
        filename = function() {
            paste(input$citrus_database)
        },
        content = function(file) {
            file.copy(paste("citrus/", getcitrus(), sep=""), file)
        })
    
    # Download selected grasses database
    output$download_grasses <- downloadHandler(
        filename = function() {
            paste(input$grasses_database)
        },
        content = function(file) {
            file.copy(paste("grasses/", getgrasses(), sep=""), file)
        })
    
    # Download selected other database
    output$download_other <- downloadHandler(
        filename = function() {
            paste(input$other_database)
        },
        content = function(file) {
            file.copy(paste("other/", getother(), sep=""), file)
        })
    
    # Download selected water weeds database
    output$download_waterweeds <- downloadHandler(
        filename = function() {
            paste(input$waterweeds_database)
        },
        content = function(file) {
            file.copy(paste("waterweeds/", getwaterweeds(), sep=""), file)
        })
    
}
)
    

