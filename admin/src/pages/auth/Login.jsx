import { useState } from "react";
import { useDispatch } from "react-redux";
import { login } from "../../store/slices/authSlice";
import { useNavigate } from "react-router-dom";

export default function Login() {
  const dispatch = useDispatch();
  const nav = useNavigate();

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [errors, setErrors] = useState({});

  // Password Validation Rules
  const rules = {
    length: password.length >= 6,
    lowercase: /[a-z]/.test(password),
    uppercase: /[A-Z]/.test(password),
    number: /\d/.test(password),
  };

  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

  const validate = () => {
    let newErrors = {};

    if (!email) {
      newErrors.email = "Email is required";
    } else if (!emailRegex.test(email)) {
      newErrors.email = "Enter a valid email";
    }

    if (!password) {
      newErrors.password = "Password is required";
    } else if (!Object.values(rules).every(Boolean)) {
      newErrors.password = "Password does not meet minimum requirements";
    }

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const submit = async (e) => {
    e.preventDefault();

    if (!validate()) return;

    try {
      await dispatch(login({ email, password })).unwrap();
      nav("/");
    } catch {
      setErrors({ form: "Invalid credentials" });
    }
  };

  return (
    <div className="h-screen flex items-center justify-center bg-gray-100 px-4">
      <div className="w-full max-w-md bg-white p-8 rounded-xl shadow">
        <h2 className="text-2xl font-bold text-center mb-4">Admin Login</h2>

        {errors.form && (
          <p className="text-red-600 mb-3 text-center">{errors.form}</p>
        )}

        <form className="space-y-4" onSubmit={submit}>
          {/* EMAIL */}
          <div>
            <label className="font-medium">Email</label>
            <input
              type="email"
              placeholder="Email"
              className={`mt-1 w-full border rounded px-3 py-2 ${
                errors.email ? "border-red-500" : ""
              }`}
              value={email}
              onChange={(e) => {
                setEmail(e.target.value);
                if (errors.email && emailRegex.test(e.target.value)) {
                  setErrors((prev) => ({ ...prev, email: "" }));
                }
              }}
            />
            {errors.email && (
              <p className="text-red-500 text-sm mt-1">{errors.email}</p>
            )}
          </div>

          {/* PASSWORD */}
          <div>
            <label className="font-medium">Password</label>
            <input
              type="password"
              placeholder="password"
              className={`mt-1 w-full border rounded px-3 py-2 ${
                errors.password ? "border-red-500" : ""
              }`}
              value={password}
              onChange={(e) => {
                setPassword(e.target.value);
                if (errors.password && Object.values(rules).every(Boolean)) {
                  setErrors((prev) => ({ ...prev, password: "" }));
                }
              }}
            />

            {/* PASSWORD LIVE VALIDATION */}
            <div className="mt-2 space-y-1 text-sm">
              <p className={`${rules.length ? "text-green-600" : "text-red-500"}`}>
                {rules.length ? "✓" : "✗"} Minimum 6 characters
              </p>
              <p className={`${rules.lowercase ? "text-green-600" : "text-red-500"}`}>
                {rules.lowercase ? "✓" : "✗"} Must contain a lowercase letter
              </p>
              <p className={`${rules.uppercase ? "text-green-600" : "text-red-500"}`}>
                {rules.uppercase ? "✓" : "✗"} Must contain an uppercase letter
              </p>
              <p className={`${rules.number ? "text-green-600" : "text-red-500"}`}>
                {rules.number ? "✓" : "✗"} Must contain a number
              </p>
            </div>

            {errors.password && (
              <p className="text-red-500 text-sm mt-1">{errors.password}</p>
            )}
          </div>

          <button className="w-full bg-black text-white py-2 rounded hover:bg-neutral-900">
            Login
          </button>
        </form>
      </div>
    </div>
  );
}
