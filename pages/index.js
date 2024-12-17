import styles from '../styles/Home.module.css';

export default function Home() {
    return (
      <div className={styles.container}>
        <h1>Welcome to AWS Cloud Practitioner Essentials.</h1>
        <p>Learn how to build, deploy, and manage applications in the AWS Cloud.</p>
        <button className={styles.button}>Get Started</button>
      </div>
    );
}