#!/bin/bash

# checking if this PC has a swap
if free | awk '/^Swap:/ {exit !$2}'; then
    echo "Have swap"
else
    echo "No swap, creating one"
    fallocate -l 1G /swapfile
    sudo chmod 600 /swapfile
    sudo mkswap /swapfile
    sudo swapon /swapfile
    sudo cp /etc/fstab /etc/fstab.bak
    echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
fi

# how 2 remove swap file:
# swapoff /swapfile
# rm /swapfile

rm -rf addons
rm -rf l10n_it*
rm -rf account_*
mkdir addons

rm -rf l10n-italy
git clone -b 10.0 https://github.com/OCA/l10n-italy.git
mv l10n-italy/l10n_it_* ./addons
rm -rf l10n-italy

rm -rf account-financial-reporting
git clone -b 10.0 https://github.com/OCA/account-financial-reporting.git
mv account-financial-reporting/account_* ./addons
rm -rf account-financial-reporting

rm -rf stock-logistics-workflow
git clone -b 10.0 https://github.com/OCA/stock-logistics-workflow.git
mv stock-logistics-workflow/stock_* ./addons
rm -rf stock-logistics-workflow

rm -rf server-tools
git clone -b 10.0 https://github.com/OCA/server-tools.git
mv server-tools/date_range ./addons
rm -rf server-tools

rm -rf partner-contact
git clone -b 10.0 https://github.com/OCA/partner-contact.git
mv partner-contact/base_location ./addons
mv partner-contact/base_location_geonames_import ./addons
rm -rf partner-contact

rm -rf l10n-italy-supplemental
git clone -b 10.0 https://github.com/zeroincombenze/l10n-italy-supplemental.git
mv l10n-italy-supplemental/l10n_it_* ./addons
rm -rf l10n-italy-supplemental
