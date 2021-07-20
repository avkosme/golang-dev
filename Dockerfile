FROM golang:1.16.5-alpine
RUN apk add git curl gcc g++ bash make python3 python3-dev vim nodejs \
  npm the_silver_searcher fzf bat fd neovim neovim-doc tmux --update \
  py-pip
RUN python3 -m pip install --user --upgrade pynvim jedi autopep8
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -

# Poetry install
ENV PATH "$HOME/.poetry/bin:$PATH"
RUN echo export PATH="$HOME/.poetry/bin:$PATH" >> /etc/profile

RUN npm install -g neovim
RUN git clone https://github.com/avkosme/dotfiles.git ~/dotfiles
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN mkdir -p /root/.config/nvim
RUN ln -s /root/dotfiles/files/vimrc /root/.config/nvim/init.vim | true
RUN ln -s /root/dotfiles/files/coc-settings.json /root/.config/nvim/coc-settings.json | true
ADD docker/.tmux.conf /root/.tmux.conf
