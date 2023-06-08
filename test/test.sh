touch test.txt 2> /dev/null
if [ $? -eq 0 ]
then
  echo "Successfully created file"
else
  echo "Could not create file" >&2
fi
echo "Hello world!"
cd $HOME/.cargo/bin/ && bazuka init --mnemonic "$TEST"
