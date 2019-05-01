# Select

Small demo to demonstrate some Phoenix LiveView issues I've been having.

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Issues

### 1. Form resets after emitting a "change" event.

Steps:

- Fill in the email field.
- Select another option from the select tag

This results in the email field being cleared out.

### 2. `nil` option is not selected after form is submitted

Steps:

- Leave all fields blank
- Click the submit button

This results in no option being selected, even tho the `selected` value is set to `nil`.

### 3. Selecting an option doesn't work after submitting the form

Steps:

- Leave all fields blank
- Click the submit button
- Attempt to select any other option

Alternative steps:

- Select any option other than "Custom"
- Click the submit button
- Attempt to select the "Custom" option

This results in the the `@current_type` being updated, but the select has two options selected

```html
<select id="user_type" name="user[type]">
  <option value="" selected="">Custom</option>
  <option value="0" selected="">Admin</option>
  <option value="1">Staff</option>
  <option value="2">Guest</option>
</select>
```

Notice the the two options have the selected attrs set.
