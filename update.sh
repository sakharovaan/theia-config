set -eux

sudo service theia stop
rm -f yarn.lock
rm -rf node_modules
rm -rf src-gen
rm -rf lib
rm -rf /home/user/.cache/yarn/
yarn
NODE_OPTIONS="--max_old_space_size=4096" yarn theia build
yarn theia download:plugins
yarn autoclean --init
echo "*.ts" >> .yarnclean
echo "*.ts.map" >> .yarnclean
echo "*.spec.*" >> .yarnclean
yarn autoclean --force
yarn cache clean
sudo service theia start
