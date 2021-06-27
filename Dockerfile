FROM golang:1.16.5-alpine
RUN apk add git curl gcc g++ make python3 python3-dev vim nodejs npm the_silver_searcher fzf bat fd neovim neovim-doc --update
RUN git clone https://github.com/avkosme/dotfiles.git ~/dotfiles
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN mkdir -p /root/.config/nvim
RUN ln -s /root/dotfiles/files/vimrc /root/.config/nvim/init.vim | true
RUN ln -s /root/dotfiles/files/coc-settings.json /root/.config/nvim/coc-settings.json | true

