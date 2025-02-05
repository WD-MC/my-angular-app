npm run ng build
npm run ng serve > output.log 2>&1 & 
sleep 1
echo $! > .pidfile

echo 'Now...'
echo 'Visit http://localhost:4200 to see your Node.js/Angular application in action.'