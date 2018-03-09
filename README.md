# DeleteAkDonations

For deleting all of your donations from your ActionKit instance.

## Usage

```
git clone https://github.com/justicedemocrats/delete-ak-donations.git
mix deps.get
export AK_BASE=https://subdomain.mydomain.com
export AK_USERNAME=myusername
export AK_PASSWORD=mypassword
mix run -e "DeleteAkDonations.go"
```

Wait a while. It's around 3k donations/minute, depending on Internet speed.
Latency matters most, so you get a good speed up by connecting to ethernet!

Bye bye donations!

