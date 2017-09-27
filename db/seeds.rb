# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

description = <<description
## The Shockenaw Mountain Boys - Food Locker

The long awaited first album from The Shockenaw Mountain Boys - Food Locker
was recorded in July of 2017 at the annual Shawnee Preservation Society
Canoe and camping trip.  It was recorded to 1 stereo microphone and the resulting
recording was pretty much perfect, warts and all.  

Tracklist:

- Angelina Baker
- Shenandoah
- Don't Let Your Deal Go Down
- Through the Gates
- Excitable Boy
- Crossing the Gap
- Two of Us
- When I Go
- Shockenaw Breakdown
- ??? I wanna go home ???
- This Blue Earth
- Rock on Daddy-O
- Cuckoo Meddly

description

Product.create({
                   title: "Food Locker mp3",
                   description: description,
                   price: 399,
                   sku: SecureRandom.uuid
               })
Product.create({
                   title: "Food Locker FLAC",
                   description: description,
                   price: 599,
                   sku: SecureRandom.uuid
               })