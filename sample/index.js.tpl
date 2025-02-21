const synthetics = require('Synthetics');
const log = require('SyntheticsLogger');

async function apiCanaryBlueprint() {
  // Usa getPage() para obtener la instancia de la página
  const page = await synthetics.getPage();
  await page.goto('https://hefesto.pragma.com.co/');
  await synthetics.takeScreenshot('homepage');
  return "Success";
}

exports.handler = async () => {
  return await apiCanaryBlueprint();
};