import { Controller } from "@hotwired/stimulus"
import { loadStripe } from "@stripe/stripe-js"

// Connects to data-controller="stripe"
export default class extends Controller {
  static values = { publicKey: String, clientSecret: String }
  static targets = ["card", "form", "submit"]

  async connect() {
    this.stripe = await loadStripe(this.publicKeyValue)
    this.elements = this.stripe.elements()
    this.cardElement = this.elements.create("card")
    this.cardElement.mount(this.cardTarget)
  }

  async submit(event) {
    event.preventDefault()

    this.submitTarget.disabled = true
    const { error, paymentIntent } = await this.stripe.confirmCardPayment(this.clientSecretValue, {
      payment_method: {
        card: this.cardElement
      }
    })

    if (error) {
      alert(error.message)
      this.submitTarget.disabled = false
    } else if (paymentIntent && paymentIntent.status === "succeeded") {
      this.formTarget.submit()
    } else {
      alert("Payment not completed.")
      this.submitTarget.disabled = false
    }
  }
}
