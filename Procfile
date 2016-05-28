web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}

web: bundle exec rackup private_pub.ru -s thin -p $PORT -E production
