cd ./meson_cdn-linux-amd64			
			
sudo ./meson_cdn config set --token=[your token]--https_port=443 --cache.size=30               #config			
sudo ./service start meson_cdn                # start node			
sudo ./service status meson_cdn               # check node running status			
			
Other commands			
sudo ./service stop meson_cdn                 # stop node			
sudo ./service remove meson_cdn               # remove node			
sudo ./service restart meson_cdn              # restart node			
sudo ./meson_cdn log                          # check logs			
./meson_cdn -h                                # check help			
			
			
GaGaNode commands			
curl -o apphub-linux-amd64.tar.gz https://assets.coreservice.io/public/package/60/app-market-gaga-pro/1.0.4/app-market-gaga-pro-1_0_4.tar.gz && tar -zxf apphub-linux-amd64.tar.gz && rm -f apphub-linux-amd64.tar.gz && cd ./apphub-linux-amd64         #download			
			
cd ./apphub-linux-amd64			
			
sudo ./apphub service install         #Install			
sudo ./apphub service start       #Start			
./apphub status       #Status			
sudo ./apps/gaganode/gaganode config set --token=gcbxmzcyisdamkjs2c15b95c4834394e         #Set token			
./apphub restart         #Restart			
			
Other commands			
sudo ./apphub service install                    # install node			
sudo ./apphub service start                      # start node			
sudo ./apphub service stop                       # stop node			
sudo ./apphub service remove                     # remove node			
./apphub status                                  # check node running status			
./apphub restart                                 # restart node			
./apphub upgrade                                 # upgrade node			
./apphub log                                     # check logs			
./apphub -h                                      # check help			
