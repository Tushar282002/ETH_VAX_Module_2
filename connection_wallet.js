// Check if MetaMask is installed and enabled
if (typeof window.ethereum !== 'undefined') {
  console.log('MetaMask is installed!');
  
  // Connect to MetaMask
  window.ethereum
    .request({ method: 'eth_requestAccounts' })
    .then(accounts => {
      // Accounts are now connected and accessible
      const address = accounts[0];
      console.log('Connected address:', address);
      
      // Additional code for interacting with MetaMask wallet
    })
    .catch(error => {
      console.error('Error connecting to MetaMask:', error);
    });
} else {
  console.log('MetaMask is not installed.');
}
