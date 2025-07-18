# Grafana-Monitoring for Azure Container App
   This project demonstrates real-world skills in monitoring Azure resources, particularly Azure Container Apps, using Azure Managed Grafana and Terraform. It showcases how to collect metrics and logs from cloud infrastructure, visualize them in custom Grafana   dashboards, and configure end-to-end observability using Azure Monitor and Log Analytics, all provisioned with Infrastructure as Code.
#  💡**Deploy to Azure in One Click** 💡
[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FYogSing%2FGrafana-Monitoring%2Fmain%2FTemplate%2Ftemplate.json)

Before deploying, replace all instances of `<your-container-image>` in the ARM template with your actual container image URI **`[myregistry/my-app-image:latest]`**
# Key Features
- Deploys Azure Managed Grafana using Terraform for Azure Container App Monitoring
- Integrates Azure Monitor, Log Analytics, and RBAC
- Custom dashboards provide real-time visibility
- Ideal for SRE, CloudOps, and DevOps use cases
# Project Structure
- **infra/**
  - `main.tf`
  - `variables.tf`
  -  `provider.tf`
- `Template`
- `.gitignore`
- `README.md`
  
# Tech Stack

- **Terraform**                         [Used to define infrastructure for the project]
- **Azure**	                            [The cloud platform where resources are deployed]
- **Azure Managed Grafana**            	[Used for monitoring dashboards & visible output of the system]
- **Log Analytics**                    	[Azure service collecting log feeds, Grafana/Monitor]
- **Azure Monitor**	                    [Collects metrics and sets up alerts, part of observability]

# Dashboard 
  <img width="1558" height="854" alt="Dashboard-Linkedin" src="https://github.com/user-attachments/assets/3f22d6d3-ff72-4349-93fe-32f34b304a18" />

# Key Setup Highlights
- **Grafana Role Assignment**:
Assigned appropriate Grafana roles to ensure user access to the Azure Managed Grafana resource.

- **Fixed Missing Role Issue**:
Encountered a missing Monitoring Reader role on the resource level, which caused data visibility issues. Resolved it by manually assigning the Monitoring Reader role to the user on the specific resource group.

# How to set up Dashboard on Grafana

1. Set Up Azure Monitor as a Data Source

    - Go to your Azure Managed Grafana instance via the Azure Portal.
    
    - Navigate to Configuration → Data Sources.
    
    - Click “Add data source” and choose Azure Monitor.
    
    - Authenticate using Managed Identities and select the right subscription.

        <img width="1076" height="812" alt="image" src="https://github.com/user-attachments/assets/4878d72d-7730-42d1-9e6f-3beaff23cb1e" />


2. Import a Dashboard

    - Go to “Dashboards” → “+ Import”.
    - Enter a Grafana.com dashboard ID(16592) and click Load
      <img width="1028" height="738" alt="image" src="https://github.com/user-attachments/assets/db23f6c9-0026-4e2e-b362-6351318cc321" />
 
3. Customize or Create Panels

    - After importing, click “Add panel” if you want to visualize additional metrics.

    - Use Azure Monitor as the data source and configure metrics like:

         - Container App CPU Usage
        
         - Memory Utilization
        
         - Error Logs from Log Analytics

4. Save and Organize

     - Name your dashboard appropriately (e.g., Container App Health Monitoring).
  
# What I Learned
- Gained hands-on experience with Grafana in Azure
- Practiced infrastructure automation using Terraform
- Learned role-based access control for Azure Grafana resources

# Infra Architecture Diagram

<img width="1263" height="779" alt="image" src="https://github.com/user-attachments/assets/051791b5-a001-4fd4-abda-ae3df7f97700" />


