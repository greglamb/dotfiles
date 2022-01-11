function dockercleanup
    killalldocker; dockerimageprune; dockervolprune
end
